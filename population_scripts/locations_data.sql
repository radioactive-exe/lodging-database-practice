-- ? Unneeded response of rows affected
SET NOCOUNT ON;

/* =====================================
=    Filling out the Regions table     =
===================================== */

-- ? These fill out with generated IDs from 1 to 12
-- ! Unfortunately, I tried to spread out regions more, but I cannot divide the world
-- ! into 20+ regions without redundancy
INSERT INTO locations.Region (RegionName, RegionDesc) VALUES
('Caribbean & Bahamas', 'Tropical island destinations.'),
('Mediterranean', 'European, Levantine, and North African climates and cuisines.'),
('Southeast Asia', 'Tropical islands and cultural heritage sites.'),
('Middle East & Gulf', 'Deserts, oases, cultured mega cities, and ancient ruins.'),
('Polynesia & South Pacific', 'Remote islands, ceremonies, and bungalows.'),
('Central America', 'Eco-tourism hotspots, dense rainforests, Mayan ruins, and surf coasts.'),
('South America', 'Diverse landscapes, with forests, mountains, and the Amazon.'),
('North America', 'Metropolitan tourism hubs, national parks, and snowy getaways.'),
('East Asia', 'High-tech city skylines with temples and mountains.'),
('Sub-Saharan Africa', 'Safaris, wildlife reserves, and nature lodges.'),
('Oceania', 'Adventure and wildlife, wine, and scenic coasts.'),
('Nordics & Arctic', 'Winter wonderlands, Aurora Borealis, and beautiful landscapes.');

PRINT 'Populated the Region LUT.';

/* =====================================
=    Filling out the Country table     =
===================================== */

-- ? These fill out with generated IDs from 1 to 21
INSERT INTO locations.Country (CountryName, RegionId) VALUES
-- ? Filled into the Caribbean, with IDs from 1 to 3
('Jamaica', 1),
('Bahamas', 1),
('Aruba', 1),

-- ? Filled into the Mediterranean, with IDs from 4 to 7
('Greece', 2),
('Italy', 2),
('Spain', 2),
('Egypt', 2),

-- ? Filled into Southeast Asia, with IDs from 8 to 10
('Thailand', 3),
('Indonesia', 3),
('Vietnam', 3),

-- ? Filled into the Middle East & Gulf, with IDs 11 and 12
('United Arab Emirates', 4),
('Jordan', 4),

-- ? Filled into Polynesia & South Pacific, with IDs 13 and 14
('Fiji', 5),
('French Polynesia', 5),

-- ? Filled into Central America, with ID 15
('Costa Rica', 6),

-- ? Filled into South America with ID 16
('Peru', 7),

-- ? Filled into North America, with IDs 17 to 19
('United States', 8),
('Canada', 8),
('Mexico', 8),

-- ? Filled into East Asia, with IDs 20 and 21
('Japan', 9),
('South Korea', 9);

PRINT 'Populated the Country LUT.'

/* =====================================
=      Filling out the Area table      =
===================================== */

-- ? These fill out with generated IDs from 1 to 23
INSERT INTO locations.Area (CountryId, AreaName, AreaDesc) VALUES
-- ? Filled into the United States, with IDs from 1 to 4
(17, 'Hawaii', 'Volcanic islands for surfing and luxury resorts.'),
(17, 'Florida', 'Sunshine state with theme parks.'),
(17, 'California Coast', 'Scenic highway and beach-front cities.'),
(17, 'Nevada Desert', 'Entertainment and beautiful desert landscapes.'),

-- ? Filled into Mexico, with IDs 5 and 6
(19, 'Quintana Roo', 'The Caribbean coastline.'),
(19, 'Baja California Sur', 'Ocean-side desert, with Los Cabos.'),

-- ? Filled into Greece, with IDs 7 and 8
(4, 'Cyclades Islands', 'Cliffside villages.'),
(4, 'Crete', 'The largest and most diverse Greek island.'),

-- ? Filled into Italy, with IDs 9 and 10
(5, 'Tuscany', 'Vineyards, villas, and art capitals.'),
(5, 'Amalfi Coast', 'Steep hillsides dropping into gorgeous waters.'),

-- ? Filled into Spain, with IDs 11 and 12
(6, 'Balearic Islands', 'Mediterranean islands including Ibiza.'),
(6, 'Andalusia', 'Moorish architecture and flamenco.'),

-- ? Filled into Egypt, with IDs 13 and 14
(7, 'Red Sea', 'Diving resort havens like Hurghada and Sharm El-Sheikh.'),
(7, 'Luxor Governorate', 'Ancient Egyptian temples along the Nile.'),

-- ? Filled into Thailand, with IDs 15 and 16
(8, 'Phuket Province', 'Thailand''s largest resort island on the Andaman Sea.'),
(8, 'Chiang Mai', 'Mountainous area sporting temples and nature.'),

-- ? Filled into Indonesia, with ID 17
(9, 'Bali Island', 'Volcanic mountains, rice growths, and beaches.'),

-- ? Filled into the United Arab Emirates, with ID 18
(11, 'Dubai', 'Global luxury shopping, architecture, and nightlife.'),

-- ? Filled into French Polynesia, with ID 19
(14, 'Society Islands', 'Home to the peaks and lagoons of Bora Bora and Tahiti.'),

-- ? Filled into Costa Rica, with ID 20
(15, 'Guanacaste', 'Pacific coast with tropical forests and surfing beaches.'),

-- ? Filled into Peru, with ID 21
(16, 'Cusco', 'Inca heritage hotspot in the Highland Andes.'),

-- ? Filled into Japan, with IDs 22 and 23
(20, 'Kyoto Prefecture', 'Cultural nexus of shrines and bamboo forests.'),
(20, 'Hokkaido', 'Hot springs and powder snow ski fields.');

PRINT 'Populated the Area LUT.'

/* =====================================
=     Filling out the Location table   =
===================================== */

-- ? These fill out with generated IDs from 1 to 23
INSERT INTO locations.Location (AreaId, LocationName, LocationDesc) VALUES
-- ? Filled into Hawaii, with IDs 1 and 2
(1, 'Waikiki Beach Resort Strip', 'Honolulu beachfront hotel area.'),
(1, 'Maui Lahaina Coast', 'Scenic coastal corridor.'),

-- ? Filled into Florida, with IDs 3 and 4
(2, 'Key West Old Town', 'Historic southernmost point of the US.'),
(2, 'Lake Buena Vista Resort Area', 'The vacation hub with major theme parks.'),

-- ? Filled into the Nevada Desert, with ID 5
(4, 'Las Vegas Strip', 'Casinos, resort hotels, and nightlife.'),

-- ? Filled into Quintana Roo, with IDs 6 and 7
(5, 'Cancun Hotel Zone', 'Island stretch with beachfront luxury.'),
(5, 'Tulum Beach Road', 'Boutique hotels and beach clubs, along with ruins.'),

-- ? Filled into the Cyclades Islands, with IDs 8 and 9
(7, 'Oia Cliffside Santorini', 'Famous blue-domed churches village with sunset views.'),
(7, 'Mykonos Old Town', 'White streets, boutique stays, and beach clubs.'),

-- ? Filled into Amalfi Coast, with ID 10
(10, 'Positano Village', 'Cliffside village with colorful sea-facing buildings.'),

-- ? Filled into the Balearic Islands, with IDs 11 and 12
(11, 'Ibiza San Antonio Harbor', 'Sunset strip with nightlife resorts.'),
(11, 'Palma de Mallorca Center', 'Historic hub with old-world boutiques and hotels.'),

-- ? Filled into the Red Sea, with IDs 13 and 14
(13, 'Hurghada Marina District', 'Waterfront promenade with boats, food, and beach resorts.'),
(13, 'Naama Bay Sharm', 'Natural bay with diving and nightlife.'),

-- ? Filled into Phuket Province, with IDs 15 and 16
(15, 'Patong Beach Strip', 'Vibrant nightlife with central public resorts and beaches.'),
(15, 'Kata Noi Luxury Cove', 'Secluded beach area to high-end luxury properties.'),

-- ? Filled into Bali Island, with IDs 17 and 18
(17, 'Ubud Rainforest Ridge', 'Cultural center known for jungle eco-lodges and wellness retreats.'),
(17, 'Seminyak Beachfront', 'Upscale beach clubs, fashion boutiques, and luxury villas.'),

-- ? Filled into Dubai, with IDs 19 and 20
(18, 'Palm Jumeirah Boardwalk', 'Man-made palm-shaped island lined with mega-resorts.'),
(18, 'Downtown Dubai Mall District', 'Urban hub housing the Burj Khalifa and luxury skyscrapers.'),

-- ? Filled into Guanacaste, with ID 21
(20, 'Tamarindo Surf Beach', 'Coastal town famous for its waves and eco-resorts.'),

-- ? Filled into Cusco, with ID 22
(21, 'Machu Picchu Sanctuary Citadel', 'Iconic 15th-century mountain Inca citadel.'),

-- ? Filled into Kyoto Prefecture, with ID 23
(22, 'Arashiyama Bamboo Grove Area', 'Scenic hills surrounded by luxurious traditional Japanese Inns.');

PRINT 'Populated the Location LUT.';
