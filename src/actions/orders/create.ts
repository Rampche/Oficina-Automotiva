import { Request, Response } from "express";
import { add } from "../../services/orders";

export default async (req: Request, res: Response) => {
  const { total, car, items, user } = req.body;
  const addOrder = await add(total, car, items, user);

  return res.json(addOrder);
};
