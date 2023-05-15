/*
  Warnings:

  - You are about to drop the `_itemtoorder` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_itemtoorder` DROP FOREIGN KEY `_ItemToOrder_A_fkey`;

-- DropForeignKey
ALTER TABLE `_itemtoorder` DROP FOREIGN KEY `_ItemToOrder_B_fkey`;

-- DropTable
DROP TABLE `_itemtoorder`;

-- CreateTable
CREATE TABLE `ItemsOnOrders` (
    `registrationId` INTEGER NOT NULL,
    `orderNumber` INTEGER NOT NULL,

    PRIMARY KEY (`registrationId`, `orderNumber`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `ItemsOnOrders` ADD CONSTRAINT `ItemsOnOrders_registrationId_fkey` FOREIGN KEY (`registrationId`) REFERENCES `Item`(`registration`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ItemsOnOrders` ADD CONSTRAINT `ItemsOnOrders_orderNumber_fkey` FOREIGN KEY (`orderNumber`) REFERENCES `Order`(`order_number`) ON DELETE RESTRICT ON UPDATE CASCADE;
