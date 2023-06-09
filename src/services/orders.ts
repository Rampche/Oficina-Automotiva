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
) => {
  //*Obtain the items
  const items = await prisma.item.findMany({
    where: {
      item_id: { in: itemIds },
    },
  });

  //*Calculate the total
  const total = items.reduce((sum, item) => sum + item.value, 0);

  const newOrder = await prisma.order.create({
    data: {
      ...order,
      total: total,
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
  return newOrder;
};

//Update orders
const update = async (
  newOrderData: Order,
  order_id: string,
  carId: string,
  userId: string,
  itemIds: string[]
) => {
  //*Obtain the items
  const items = await prisma.item.findMany({
    where: {
      item_id: { in: itemIds },
    },
  });

  const updatedTotal = items.reduce((sum, item) => sum + item.value, 0);

  const updatedOrder = await prisma.order.update({
    where: {
      order_id,
    },

    data: {
      ...newOrderData,
      total: updatedTotal,
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
  return updatedOrder;
};

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
