/*
  Warnings:

  - You are about to drop the column `carId` on the `order` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_carId_fkey`;

-- AlterTable
ALTER TABLE `order` DROP COLUMN `carId`;

-- CreateTable
CREATE TABLE `_CarToOrder` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_CarToOrder_AB_unique`(`A`, `B`),
    INDEX `_CarToOrder_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `_CarToOrder` ADD CONSTRAINT `_CarToOrder_A_fkey` FOREIGN KEY (`A`) REFERENCES `Car`(`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CarToOrder` ADD CONSTRAINT `_CarToOrder_B_fkey` FOREIGN KEY (`B`) REFERENCES `Order`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
