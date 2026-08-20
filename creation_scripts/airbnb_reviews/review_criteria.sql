/**
*
* The creation script for the Review criteria table
*
*/

DROP TABLE IF EXISTS reviews.ReviewCriteria;

CREATE TABLE reviews.ReviewCriteria (

    /* Criterion Info
    ===================================== */

    CriterionId           tinyint IDENTITY (1, 1) NOT NULL,
    -- * I.e. "Cleanliness", "Service", "Host Manners"
    CriterionName         varchar(64) NOT NULL UNIQUE,
    CriterionDescription  varchar(256) NOT NULL,

    -- ? The weight of the individual criterion when compiling an overall property rating from all criteria
    CriterionReviewWeight decimal(4, 2) DEFAULT (1.0) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the review criterion ID
    CONSTRAINT PK_ReviewCriteria PRIMARY KEY CLUSTERED (CriterionId),

    -- * Limit and constraint for criterion weight
    CONSTRAINT CHK_Valid_CriterionWeight CHECK (
        CriterionReviewWeight >= 0
        -- ? An arbitrary but plausible limit on the weight of a criterion
        AND CriterionReviewWeight <= 10
    )
);

PRINT 'Created Review Criteria LUT.';

GO

/**
*
* The creation script for the Criteria Rating relationship table
*
*/

DROP TABLE IF EXISTS reviews.CriteriaRatings;

CREATE TABLE reviews.CriteriaRatings (

    /* Criterion and Associated review
    ===================================== */

    ReviewId    bigint NOT NULL,
    CriterionId tinyint NOT NULL,

    -- * The rating for the criterion for this review
    Rating      decimal(2, 1) NOT NULL,

    /* Constraints
    ===================================== */

    -- * Primary key constraint for the criterion and review IDs
    CONSTRAINT PK_CriteriaRatings PRIMARY KEY (ReviewId, CriterionId),

    -- * Foreign key constraints for the criterion and review IDs
    CONSTRAINT FK_CriteriaRating_Review FOREIGN KEY (ReviewId) REFERENCES reviews.PropertyReview (ReviewId),
    CONSTRAINT FK_CriteriaRating_Criterion FOREIGN KEY (CriterionId) REFERENCES reviews.ReviewCriteria (CriterionId),

    -- * Validation and limiting of the rating
    CONSTRAINT CHK_Valid_CriterionRating CHECK (
        -- ? Between 0 and 5 stars total
        Rating >= 0
        AND Rating <= 5

        -- ? Divisible by half (i.e., either a whole star/rating or a half star/rating, like 2 and 2.5)
        AND (Rating % 0.5 = 0)
    )
);

PRINT 'Created Criteria-Rating Relationship table.';

GO

-- ! This function has to be put here (after these two tables, but before the property review table)
-- ! as it is used in a computed column in that table, but requires these two. That is why it is not in
-- ! the main functions.sql file

/**
*
* This function gathers a total weighted rating for a property based on an associated booking and all
* the reviewed criteria associated with the booking's review
*
*/
CREATE
OR ALTER
FUNCTION reviews.FN_TotalPropertyReviewRating(@ReviewId bigint) RETURNS decimal(3, 2)
AS
BEGIN
    RETURN (
        -- ? We select and use aggregate functions to calculate the total review score for all the ratings
        SELECT
            -- ? If the result is null - i.e. a column failed to return something or the NULLIF created a NULL, then (1/2)
            ISNULL(
                -- ? Cast to ensure we are returning the proper type
                CAST(
                -- ? Add all the ratings multiplied by their relative weights
                    SUM(Ratings.Rating * Criteria.CriterionReviewWeight)

                    -- ? Divide by the sum of all weights.
                    -- ! We use a NULLIF here so the program doesn't crash if we somehow have a NULL criterion review weight
                    -- ! for example if the criterion ID somehow breaks, etc. by attempting to divide by 0. NULL above is
                    -- ! dealt with easily, but not here
                    / SUM(NULLIF(Criteria.CriterionReviewWeight, 0.0))

                    AS decimal(3, 2)

                -- ? Return 0.00 as a fallback (2/2)
                ), 0.00
            )
        -- ? Get all criterion ratings (1/3)
        FROM properties.CriteriaRatings AS Ratings
        -- ? And all their weights (2/3)
        INNER JOIN reviews.ReviewCriteria AS Criteria
            ON Ratings.CriterionId = Criteria.CriterionId
        -- ? For the passed review (3/3)
        WHERE Ratings.ReviewId = @ReviewId
    );
END;

GO

PRINT 'Created Total Property Review Rating compilation function.';

GO

-- ? The computed total rating column is now added to the PropertyReview table
-- ? now that all looped dependencies are sorted
-- ! See the creation script for the PropertyReview table for the full information
ALTER TABLE reviews.PropertyReview
ADD
-- ? The derived and weighted total rating for the property linked with a particular booking
TotalRating AS reviews.FN_TotalPropertyReviewRating(ReviewId);
-- ? We cannot add a CHECK constraint to clamp the Total rating, as it is a non-persisted computed column,
-- ? but given that the values used in the original ratings are limited between 0 and 5, then the
-- ? calculation will automatically be within that range, so that helps with the Limitation

GO

PRINT 'Added Computed Total Property Review Rating column.';
