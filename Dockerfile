FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y stress-ng iputils-ping

COPY stress_tests/cpu_stress.sh /cpu_stress.sh
COPY stress_tests/memory_stress.sh /memory_stress.sh
COPY stress_tests/io_stress.sh /io_stress.sh
COPY stress_tests/network_stress.sh /network_stress.sh

RUN chmod +x /cpu_stress.sh /memory_stress.sh /io_stress.sh /network_stress.sh

CMD ["/bin/bash", "-c", "/cpu_stress.sh & /memory_stress.sh & /io_stress.sh & /network_stress.sh"]
