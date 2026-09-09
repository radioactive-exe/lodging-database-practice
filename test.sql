-- SELECT
--     UserCollections.CollectionName,
--     COUNT(*)
-- FROM users.PropertiesInCollections
-- INNER JOIN users.UserCollections
--     ON (PropertiesInCollections.CollectionId = UserCollections.CollectionId)
-- GROUP BY (UserCollections.CollectionName);

-- SELECT Payments.PaymentId, PropertyBookings.BookingId, PropertyBookings.TotalBookingCost, Payments.PaidAmount, Payments.AmountRemaining, PaymentPurpose.PurposeName, Payments.PaidOn
-- FROM reservations.Payments INNER JOIN reservations.PropertyBookings ON Payments.AssocBookingId = PropertyBookings.BookingId INNER JOIN reservations.PaymentPurpose ON Payments.PaymentPurposeId = PaymentPurpose.PurposeId
-- ORDER BY PropertyBookings.BookingId, Payments.PaidOn ASC;

SELECT
    * FROM reviews.PropertyReview WHERE TotalRating > 0