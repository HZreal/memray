from _pensieve.records cimport Allocation
from libcpp cimport bool
from libcpp.vector cimport vector


cdef extern from "snapshot.h" namespace "pensieve::api":
    cdef struct HighWatermark:
        size_t index
        size_t peak_memory

    HighWatermark getHighWatermark(const vector[Allocation]& records) except+
    object Py_GetSnapshotAllocationRecords(const vector[Allocation]& all_records, size_t record_index, bool merge_threads) except+