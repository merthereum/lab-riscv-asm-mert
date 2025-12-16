#define N 3
#define M 5

int sum_array(int arr[N][M]) {
    int sum = 0;

    for (int i = 0; i < N; i++) {
        for (int j = 0; j < M; j++) {
            sum += arr[i][j];   // tüm elemanların toplamı
        }
    }

    return sum;
}

int main(void) {
    int arr[N][M] = {
        {  1,  2,  3,  4,  5 },
        {  6,  7,  8,  9, 10 },
        { 11, 12, 13, 14, 15 }
    };

    int result = sum_array(arr);

    // Programın çıkış kodu olarak sonucu döndürüyoruz
    // (printf kullanmak zorunlu değil)
    return result;      // 120
}
