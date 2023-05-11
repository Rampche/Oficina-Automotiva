/*
  Warnings:

  - Added the required column `observation` to the `Car` table without a default value. This is not possible if the table is not empty.
  - Added the required column `registration` to the `Car` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_number` to the `Order` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `car` ADD COLUMN `observation` VARCHAR(255) NOT NULL,
    ADD COLUMN `registration` VARCHAR(255) NOT NULL;

-- AlterTable
ALTER TABLE `order` ADD COLUMN `order_number` INTEGER NOT NULL;
