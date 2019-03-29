#!/bin/bash

option=${1:-0}

docker pull gabrielorozco20/clearwater-bono2:latest && docker pull gabrielorozco20/clearwater-homer2:latest && docker pull gabrielorozco20/clearwater-ellis2:latest && docker pull gabrielorozco20/clearwater-urcassandra:latest && docker pull gabrielorozco20/clearwater-mschomestead:latest && docker pull gabrielorozco20/clearwater-ursprout:latest && docker pull gabrielorozco20/clearwater-sipptest2:latest && docker pull juansorduz/clearwater-astaire2:latest && docker pull && juansorduz/clearwater-ralf2:latest && docker pull juansorduz/clearwater-chronos2:latest && docker pull juansorduz/clearwater-homestead-prov2:latest && docker pull juansorduz/clearwater-msccassandra:latest && docker pull juansorduz/clearwater-urhomestead:latest && docker pull juansorduz/clearwater-mscsprout:latest
