rm ~/PerformanceResults/*
while true; do
top -b -n 1 | awk 'NR > 7 { sum += $9 } END { print sum }' >> ~/PerformanceResults/CPUTop.csv
top -b -n 1 | awk 'NR > 7 { sum += $10 } END { print sum }' >> ~/PerformanceResults/MemoryTop.csv
done
