for /F "tokens=*" %%g in ('docker ps -l -q') do (set ros2=%%g)
docker exec -it %ros2% /ros2_entrypoint.sh bash