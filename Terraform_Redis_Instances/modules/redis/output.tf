output "redis_instances" {
  value = {
    for key, redis in google_redis_instance.redis : key => redis.host
  }
}
