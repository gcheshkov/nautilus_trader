#!/usr/bin/env python3
# -------------------------------------------------------------------------------------------------
# <copyright file="order_perf.py" company="Nautech Systems Pty Ltd">
#  Copyright (C) 2015-2019 Nautech Systems Pty Ltd. All rights reserved.
#  The use of this source code is governed by the license as found in the LICENSE.md file.
#  http://www.nautechsystems.io
# </copyright>
# -------------------------------------------------------------------------------------------------

import unittest
import timeit
from time import time

from nautilus_trader.model.objects import Symbol
from nautilus_trader.model.enums import Venue
from nautilus_trader.model.identifiers import OrderIdGenerator

MILLISECONDS_IN_SECOND = 1000
AUDUSD_FXCM = Symbol('USDJPY', Venue.FXCM)


class OrderIdGeneratorPerformanceTest:
    def __init__(self):
        self.symbol = AUDUSD_FXCM
        self.generator = OrderIdGenerator('001', '001')

    def generate(self):
        self.generator.generate()


class OrderPerformanceTests(unittest.TestCase):

    @staticmethod
    def test_order_id_generator():
        # Arrange
        tests = 3
        number = 10000
        test = OrderIdGeneratorPerformanceTest()

        total_elapsed = 0

        for x in range(tests):
            srt_time = time()
            timeit.Timer(test.generate).timeit(number=number)
            end_time = time()
            total_elapsed += round((end_time - srt_time) * MILLISECONDS_IN_SECOND)

        print('\n' + f'test_order_id_generator({number} iterations)')
        print(f'{round(total_elapsed / tests)}ms')

        # ~17ms for 10000 ids
