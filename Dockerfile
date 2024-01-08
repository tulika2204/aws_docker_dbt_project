# Use an official Ubuntu image as the base imageF
FROM ghcr.io/dbt-labs/dbt-snowflake:1.5.5
ENTRYPOINT [ "/bin/bash" ]
RUN apt-get update
RUN apt-get -y install git bash
RUN git clone https://github.com/amos-eda-97/aws_to_swnoflake_dbt_repo.git
WORKDIR "/root"
RUN mkdir .dbt
WORKDIR "/usr/app/dbt/aws_to_swnoflake_dbt_repo"
RUN cp profiles/profiles.yml /root/.dbt/
COPY ./run_script.sh .
CMD ["./run_script.sh"]