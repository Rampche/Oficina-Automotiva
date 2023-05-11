/*
  Warnings:

  - The primary key for the `car` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `observations` on the `car` table. All the data in the column will be lost.
  - You are about to drop the column `registration` on the `car` table. All the data in the column will be lost.
  - The primary key for the `item` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `order` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - The primary key for the `user` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[orderId]` on the table `Item` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `orderId` to the `Item` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_carId_fkey`;

-- DropIndex
DROP INDEX `Car_registration_key` ON `car`;

-- AlterTable
ALTER TABLE `car` DROP PRIMARY KEY,
    DROP COLUMN `observations`,
    DROP COLUMN `registration`,
    ADD COLUMN `deleted` BOOLEAN NOT NULL DEFAULT false,
    MODIFY `car_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`car_id`);

-- AlterTable
ALTER TABLE `item` DROP PRIMARY KEY,
    ADD COLUMN `orderId` VARCHAR(191) NOT NULL,
    MODIFY `item_id` VARCHAR(191) NOT NULL,
    MODIFY `name` VARCHAR(255) NOT NULL,
    MODIFY `value` FLOAT NOT NULL,
    ADD PRIMARY KEY (`item_id`);

-- AlterTable
ALTER TABLE `order` DROP PRIMARY KEY,
    ADD COLUMN `userId` VARCHAR(191) NOT NULL,
    MODIFY `order_id` VARCHAR(191) NOT NULL,
    MODIFY `order_date` DATE NOT NULL,
    MODIFY `order_time` TIME NOT NULL,
    MODIFY `total` FLOAT NULL,
    MODIFY `carId` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`order_id`);

-- AlterTable
ALTER TABLE `user` DROP PRIMARY KEY,
    MODIFY `user_id` VARCHAR(191) NOT NULL,
    ADD PRIMARY KEY (`user_id`);

-- CreateIndex
CREATE UNIQUE INDEX `Item_orderId_key` ON `Item`(`orderId`);

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_carId_fkey` FOREIGN KEY (`carId`) REFERENCES `Car`(`car_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Item` ADD CONSTRAINT `Item_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `Order`(`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
