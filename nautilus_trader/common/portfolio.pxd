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

from cpython.datetime cimport date

from nautilus_trader.model.c_enums.currency cimport Currency
from nautilus_trader.model.events cimport PositionEvent, PositionOpened, PositionModified, PositionClosed
from nautilus_trader.model.identifiers cimport Symbol
from nautilus_trader.model.objects cimport Money
from nautilus_trader.common.clock cimport Clock
from nautilus_trader.common.guid cimport GuidFactory
from nautilus_trader.common.logging cimport LoggerAdapter


cdef class Portfolio:
    cdef LoggerAdapter _log
    cdef Clock _clock
    cdef GuidFactory _guid_factory

    cdef dict _positions_open
    cdef dict _positions_closed

    cdef readonly date date_now
    cdef readonly Currency currency
    cdef readonly Money daily_pnl_realized
    cdef readonly Money total_pnl_realized

    cpdef void update(self, PositionEvent event) except *
    cpdef void reset(self) except *
    cpdef set symbols_open(self)
    cpdef set symbols_closed(self)
    cpdef set symbols_all(self)
    cpdef dict positions_open(self, Symbol symbol=*)
    cpdef dict positions_closed(self, Symbol symbol=*)
    cpdef dict positions_all(self, Symbol symbol=*)

    cdef void _handle_position_opened(self, PositionOpened event) except *
    cdef void _handle_position_modified(self, PositionModified event) except *
    cdef void _handle_position_closed(self, PositionClosed event) except *
