awk 'function f(x){if(x<2)return 1;return x*f(x-1)}NR>1{print f($0)}'
