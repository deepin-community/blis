{
  # Export BLAS and CBLAS symbols
  global:
    cblas_*;
    *_;
    CBLAS_*;
    RowMajorStrg;

  # Hide everything else.
  local:
    bli_thread_set_num_threads_;
    bli_thread_set_ways_;
    bli_*;
    *;
};
