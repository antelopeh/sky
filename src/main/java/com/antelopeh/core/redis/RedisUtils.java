package com.antelopeh.core.redis;

import com.antelopeh.core.spring.SpringContextUtil;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

public class RedisUtils {
    private static final RedisTemplate<String, Serializable> redisTemplate = SpringContextUtil.getBean("redisTemplate", RedisTemplate.class);

    private static final JdkSerializationRedisSerializer VALUE_SERIALIZER = (JdkSerializationRedisSerializer) redisTemplate.getValueSerializer();

    private static final StringRedisSerializer KEY_SERIALIZER = (StringRedisSerializer) redisTemplate.getKeySerializer();

    public static Set<String> keys(String pattern) {

        return redisTemplate.keys(pattern);
    }

    public static void delete(String key) {
        redisTemplate.delete(key);
    }

    public static void delete(List<String> keys) {
        redisTemplate.delete(keys);
    }

    public static void clear() {
        redisTemplate.execute((RedisCallback<Boolean>) connection -> {
            connection.flushDb();
            return true;
        });
    }

    public static Object get(String key) {
        return redisTemplate.execute((RedisCallback<Object>) connection -> {
            byte[] value = connection.get(KEY_SERIALIZER.serialize(key));
            return value == null ? null : VALUE_SERIALIZER.deserialize(value);
        });
    }

    public static Long getIncrValue(String key) {
        return redisTemplate.execute((RedisCallback<Long>) connection -> {
            byte[] value = connection.get(KEY_SERIALIZER.serialize(key));
            return value == null ? null : Long.parseLong(redisTemplate.getStringSerializer().deserialize(value));
        });
    }
    
    public static void set(String key, Object obj) {
        redisTemplate.execute((RedisCallback<Long>) connection -> {
            connection.set(KEY_SERIALIZER.serialize(key), VALUE_SERIALIZER.serialize(obj));
            return 1L;
        });
    }

    public static Boolean setNx(String key, Object obj) {
        return redisTemplate.execute((RedisCallback<Boolean>) connection ->
                connection.setNX(KEY_SERIALIZER.serialize(key), VALUE_SERIALIZER.serialize(obj)));
    }

    public static Boolean setNxEx(String key, Object obj, long expireTime) {
        return redisTemplate.execute((RedisCallback<Boolean>) connection -> {
            Boolean flag = connection.setNX(KEY_SERIALIZER.serialize(key), VALUE_SERIALIZER.serialize(obj));
            if (flag && expireTime > 0) {
                connection.expire(KEY_SERIALIZER.serialize(key), expireTime);
            }
            return flag;
        });
    }

    public static void set(String key, Object obj, long expireTime) {
        redisTemplate.execute((RedisCallback<Long>) connection -> {
            connection.set(KEY_SERIALIZER.serialize(key), VALUE_SERIALIZER.serialize(obj));
            if (expireTime > 0) {
                connection.expire(KEY_SERIALIZER.serialize(key), expireTime);
            }
            return 1L;
        });
    }

    public static void setExpire(String key, long expireTime) {
        redisTemplate.execute((RedisCallback<Boolean>) connection -> {
            if (expireTime > 0) {
                connection.expire(KEY_SERIALIZER.serialize(key), expireTime);
            }
            return Boolean.FALSE;
        });
    }
    
    public static void incrBy(String key, Integer value) {
    	redisTemplate.opsForValue().increment(key, value);
    }
}
