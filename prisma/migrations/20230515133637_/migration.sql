/*
  Warnings:

  - You are about to drop the column `registration` on the `car` table. All the data in the column will be lost.
  - You are about to drop the column `orderId` on the `item` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[registration]` on the table `Item` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[order_number]` on the table `Order` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `plate` to the `Car` table without a default value. This is not possible if the table is not empty.
  - Added the required column `registration` to the `Item` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `item` DROP FOREIGN KEY `Item_orderId_fkey`;

-- AlterTable
ALTER TABLE `car` DROP COLUMN `registration`,
    ADD COLUMN `plate` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `item` DROP COLUMN `orderId`,
    ADD COLUMN `registration` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `_ItemToOrder` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_ItemToOrder_AB_unique`(`A`, `B`),
    INDEX `_ItemToOrder_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `Item_registration_key` ON `Item`(`registration`);

-- CreateIndex
CREATE UNIQUE INDEX `Order_order_number_key` ON `Order`(`order_number`);

-- AddForeignKey
ALTER TABLE `_ItemToOrder` ADD CONSTRAINT `_ItemToOrder_A_fkey` FOREIGN KEY (`A`) REFERENCES `Item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ItemToOrder` ADD CONSTRAINT `_ItemToOrder_B_fkey` FOREIGN KEY (`B`) REFERENCES `Order`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
