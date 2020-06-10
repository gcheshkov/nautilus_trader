# -------------------------------------------------------------------------------------------------
#  Copyright (C) 2015-2020 Nautech Systems Pty Ltd. All rights reserved.
#  https://nautechsystems.io
#
#  Licensed under the GNU Lesser General Public License Version 3.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at https://www.gnu.org/licenses/lgpl-3.0.en.html
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# -------------------------------------------------------------------------------------------------


cpdef enum MarketPosition:
    UNDEFINED = 0,  # Invalid value
    FLAT = 1,
    LONG = 2,
    SHORT = 3


cdef inline str market_position_to_string(int value):
    if value == 1:
        return 'FLAT'
    elif value == 2:
        return 'LONG'
    elif value == 3:
        return 'SHORT'
    else:
        return 'UNDEFINED'


cdef inline MarketPosition market_position_from_string(str value):
    if value == 'FLAT':
        return MarketPosition.FLAT
    elif value == 'LONG':
        return MarketPosition.LONG
    elif value == 'SHORT':
        return MarketPosition.SHORT
    else:
        return MarketPosition.UNDEFINED
