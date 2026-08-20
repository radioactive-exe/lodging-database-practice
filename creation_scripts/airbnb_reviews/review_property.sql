/**
*
* The creation script for the Property Review table
*
*/

DROP TABLE IF EXISTS reviews.PropertyReview;

CREATE TABLE reviews.PropertyReview (

    /* Review ID and associated items
    ===================================== */

    ReviewId            bigint IDENTITY (1, 1) NOT NULL,
    -- ! There was also a property id FK that referenced the property being reviewed,
    -- ! but given that the booking table's row has the property ID, having the property here
    -- ! as well may violate normal forms, and it introduces another point of error (what if
    -- ! a different property ID is inserted here from the frontend?).
    -- ? The specific booking linked with this review
    AssociatedBookingId bigint NOT NULL,
    -- ? The user making this review
    ReviewerId          bigint NOT NULL,

    /* Review Content
    ===================================== */

    ReviewTitle         nvarchar(100) NOT NULL,
    ReviewComment       nvarchar(1000) NOT NULL,
    ReviewedOn          datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    -- ! There is a total rating column in this table that dynamically gets the
    -- ! total rating from fetching data from both CriteriaRatings and ReviewCriteria,
    -- ! but it is not defined in this script, because –
    -- ! It ended up proving to be an issue. Here is the issue and my solution:
    -- ? (1) CriteriaRatings needs PropertyReview to exist as a table before it is created, due to the FK
    -- ? (2) PropertyReview has the TotalRating column
    -- ? (3) The TotalRating is computed from values in CriteriaRatings and ReviewCriteria,
    -- !     and so it needs them both to exist before being created
    -- ! /!\ I now have a circular dependency, which, while logical, gives me immense trouble in
    -- !     creating these tables. I thus resorted to this solution in order to keep the schema
    -- !     and database design as planned:
    -- ? (1) I create the PropertyReview table first, WITHOUT the TotalRating column
    -- ? (2) Then, I create (ReviewCriteria and) CriteriaRatings, as its ReviewId FK is satisfied
    -- ?     by the creation of step (1)'s table, and ReviewCriteria is a LUT so that's fine
    -- ? (3) Lastly, I add the TotalRating column to the PropertyReview table, as now its computation has all
    -- ?     required tables now created from step (2)

    /* Constraints
    ===================================== */

    -- ? Primary key constraint for the review ID
    CONSTRAINT PK_PropertyReviewId PRIMARY KEY CLUSTERED (ReviewId),

    -- ? Foreign key constraints for the reviewer and booking IDs
    CONSTRAINT FK_PropertyReview_Booking FOREIGN KEY (AssociatedBookingId) REFERENCES reservations.PropertyBookings (BookingId),
    CONSTRAINT FK_PropertyReview_Reviewer FOREIGN KEY (ReviewerId) REFERENCES users.UserAccount (UserId),

    -- ? Unique constraint for the booking-user-property trio, ensuring a user can't rate a property for a same booking twice (they can edit),
    -- ? but that is frontend functionality. This constraint was not in the original plan, but it makes sense more now
    CONSTRAINT UQ_PropertyReview_Booking_Reviewer_Property UNIQUE (AssociatedBookingId, ReviewerId)
);

PRINT 'Created Property Review (without Total Rating) table.';
