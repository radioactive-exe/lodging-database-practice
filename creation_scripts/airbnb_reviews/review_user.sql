/**
*
* The creation script for the User Review table
*
*/

DROP TABLE IF EXISTS reviews.UserReview;

CREATE TABLE reviews.UserReview (

    /* Review ID and associated items
    ===================================== */

    ReviewId            bigint IDENTITY (1, 1) NOT NULL,
    -- ? The user being reviewed
    TargetId            bigint NOT NULL,
    -- ? The user making this review
    ReviewerId          bigint NOT NULL,
    -- ? The specific booking of the host's property linked with this review
    AssociatedBookingId bigint NOT NULL,

    /* Review Content
    ===================================== */

    ReviewTitle         nvarchar(100) NOT NULL,
    ReviewComment       nvarchar(500) NOT NULL,
    Rating              decimal(2, 1) NOT NULL,
    ReviewedOn          datetime2 DEFAULT (SYSUTCDATETIME()) NOT NULL,

    /* Constraints
    ===================================== */

    -- ? Primary key constraint for the review ID
    CONSTRAINT PK_UserReviewId PRIMARY KEY CLUSTERED (ReviewId),

    -- ? Foreign key constraints for the property, reviewer, and booking IDs
    CONSTRAINT FK_UserReview_Target FOREIGN KEY (TargetId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_UserReview_Reviewer FOREIGN KEY (ReviewerId) REFERENCES users.UserAccount (UserId),
    CONSTRAINT FK_UserReview_Booking FOREIGN KEY (AssociatedBookingId) REFERENCES reservations.PropertyBookings (BookingId),

    -- ? Unique constraint for the booking-user-target trio, ensuring a user can't rate a host for a same booking twice (they can edit),
    -- ? but that is frontend functionality. This constraint was not in the original plan, but it makes sense more now
    CONSTRAINT UQ_UserReview_Booking_Reviewer_Target UNIQUE (TargetId, ReviewerId, AssociatedBookingId),

    -- ? Checks the range and value of the rating
    CONSTRAINT CHK_Valid_UserReviewRating CHECK (
        -- ? Rating is between 0 and 5
        Rating >= 0
        AND Rating <= 5

        -- ? And the rating is divisible by half (either a whole number or half, like 2 or 2.5)
        AND Rating % 0.5 = 0
    ),

    -- ? Ensures no user is reviewing themselves
    CONSTRAINT CHK_Valid_UserReviewReviewerTarget CHECK (ReviewerId != TargetId)
);

PRINT 'Created User Review table.';
