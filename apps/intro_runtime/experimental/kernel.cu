// Try this with BUFSIZE <= 128
#define BUFSIZE 256

extern "C" __global__ void kernel() {
    __shared__ unsigned int buffer[BUFSIZE];

    // spin for a while...
    for (unsigned long long int i = 0; i < 1000ULL; i++) {
        __nanosleep(2000000U);
    }

    // non-trivial shared memory usage so it doesn't get optimized away
    buffer[threadIdx.x % BUFSIZE] = 1;
    unsigned int ans = buffer[(threadIdx.x + 1) % BUFSIZE];

    __nanosleep(ans);
}
