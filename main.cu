#include <library/host_vector.h>
#include <library/device_vector.h>
#include <library/generate.h>
#include <library/sort.h>
#include <library/copy.h>
#include <algorithm>
#include <cstdlib>

int main(void)
{
  // 1 million element
  long unsigned size = 1 << 20
  
  thrust::host_vector<int> h_vec(size);
  std::generate(h_vec.begin(), h_vec.end(), rand);

  // transfer data to the device
  thrust::device_vector<int> d_vec = h_vec;

  // sort data on the device
  thrust::sort(d_vec.begin(), d_vec.end());

  // transfer data back to host
  thrust::copy(d_vec.begin(), d_vec.end(), h_vec.begin());

  return 0;
}
