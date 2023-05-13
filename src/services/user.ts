import { PrismaClient } from '@prisma/client';
import { User } from '../models/user';

export const prisma = new PrismaClient();

//Create a new user
const create = (user: User) =>
  prisma.user.create({
    data: {
      ...user,
    },
  });

//Update the user
const update = (id: string, user: User) =>
  prisma.user.update({
    where: { user_id: id },
    data: { ...user },
  });

//Delete the user
const remove = (id: string) =>
  prisma.user.update({
    where: {
      user_id: id,
    },
    data: {
      deleted: true,
    },
  });

//List all user
const list = () =>
  prisma.user.findMany({
    where: {
      deleted: false,
    },
  });

//Detail a user
const read = (user_id: string) =>
  prisma.user.findFirst({
    where: {
      user_id,
      deleted: false,
    },
  });

export { create, read, update, remove, list };
