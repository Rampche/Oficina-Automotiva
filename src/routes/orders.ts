import express from 'express';
import { list } from '../actions/orders';

const router = express.Router();

router.get('', list);

export default router;
