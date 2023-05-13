import { Request, Response, response } from 'express';
import { create } from '../../services/user';
import { User } from '../../models/user';

export default async (req: Request, res: Response) => {
  const { ...user }: User = req.body;
  /* const order_id: string = req.body; */

  const newUser = await create(user /* order_id */);

  return res.json(newUser);
};
