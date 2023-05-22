//import { PrismaClient } from '@prisma/client';
import { PrismaClient } from '@prisma/client';
import { Order } from '../models/order';

export const prisma = new PrismaClient();

//List all service orders
const list = () =>
  prisma.order.findMany({
    where: {
      deleted: false,
    },
  });

//Detail the orders
const detail = (order_id: string) =>
  prisma.order.findFirst({
    where: {
      order_id,
      deleted: false,
    },
    include: {
      car: true,
      items: true,
    },
  });

//Create new orders
const create = async (
  order: Order,
  carId: string,
  userId: string,
  itemIds: string[]
) =>
  prisma.order.create({
    data: {
      ...order,
      car: {
        connect: { car_id: carId },
      },
      user: {
        connect: { user_id: userId },
      },
      items: {
        connect: itemIds.map((item) => ({ item_id: item })),
      },
    },
    include: {
      items: true,
    },
  });

//Update orders
const update = (
  order_id: string,
  itemIds: string[],
  carId: string,
  userId: string
) =>
  prisma.order.update({
    where: {
      order_id,
    },

    data: {
      items: {
        connect: itemIds.map((itemId) => ({ item_id: itemId })),
      },
      car: {
        connect: { car_id: carId },
      },
      user: {
        connect: { user_id: userId },
      },
    },
  });

//Remove orders
const remove = (order_id: string) => {
  prisma.order.update({
    where: { order_id },
    data: {
      deleted: true,
    },
  });
};

export { list, detail, create, update, remove };
