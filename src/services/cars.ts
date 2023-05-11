import { PrismaClient } from '@prisma/client';
import { Car } from '../models/car';

export const prisma = new PrismaClient();

//Create a new car
const create = (car: Car) =>
  prisma.car.create({
    data: {
      ...car,
    },
  });

//Update the car
const update = (id: string, car: Car) =>
  prisma.car.update({
    where: { car_id: id },
    data: { ...car },
  });

//Delete the car
const remove = (id: string) =>
  prisma.car.update({
    where: {
      car_id: id,
    },
    data: {
      deleted: true,
    },
  });

//List all Cars
const list = () =>
  prisma.car.findMany({
    where: {
      deleted: false,
    },
  });

//Detail a Car
const read = (car_id: string) =>
  prisma.car.findFirst({
    where: {
      car_id,
      deleted: false,
    },
  });

export { create, read, update, remove, list };
