/*
  Warnings:

  - You are about to drop the `itemsonorders` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `itemsonorders` DROP FOREIGN KEY `ItemsOnOrders_orderNumber_fkey`;

-- DropForeignKey
ALTER TABLE `itemsonorders` DROP FOREIGN KEY `ItemsOnOrders_registrationId_fkey`;

-- AlterTable
ALTER TABLE `item` MODIFY `registration` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `order` MODIFY `order_number` VARCHAR(255) NOT NULL;

-- DropTable
DROP TABLE `itemsonorders`;

-- CreateTable
CREATE TABLE `_ItemToOrder` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_ItemToOrder_AB_unique`(`A`, `B`),
    INDEX `_ItemToOrder_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_ItemToOrder` ADD CONSTRAINT `_ItemToOrder_A_fkey` FOREIGN KEY (`A`) REFERENCES `Item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ItemToOrder` ADD CONSTRAINT `_ItemToOrder_B_fkey` FOREIGN KEY (`B`) REFERENCES `Order`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
