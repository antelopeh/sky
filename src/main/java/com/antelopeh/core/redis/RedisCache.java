package com.antelopeh.core.redis;

import org.springframework.cache.Cache;
import org.springframework.cache.support.SimpleValueWrapper;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;

import java.io.*;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.Callable;


public class RedisCache implements Cache {
	
	private RedisTemplate<String, Object> redisTemplate;  
    private String name;  
  
    public RedisTemplate<String, Object> getRedisTemplate() {  
        return redisTemplate;  
    }  
  
    public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {  
        this.redisTemplate = redisTemplate;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
  
    @Override  
    public String getName() {  
        return this.name;  
    }  
  
    @Override  
    public Object getNativeCache() {  
        return this.redisTemplate;  
    }  
  
    @Override  
    public ValueWrapper get(Object key) {
        final String keyf = (String) key;  
        Object object = null;  
        object = redisTemplate.execute(new RedisCallback<Object>() {  
            public Object doInRedis(RedisConnection connection)  
                    throws DataAccessException {
  
                byte[] key = keyf.getBytes();  
                byte[] value = connection.get(key);  
                if (value == null) {  
                    return null;  
                }  
                return toObject(value);  
  
            }  
        });  
        return (object != null ? new SimpleValueWrapper(object) : null);
    }  
  
    @Override  
    public void put(Object key, Object value) {  
        final String keyf = (String) key;  
        final Object valuef = value;  
  
        redisTemplate.execute(new RedisCallback<Long>() {  
            public Long doInRedis(RedisConnection connection)  
                    throws DataAccessException {
                byte[] keyb = keyf.getBytes();  
                byte[] valueb = toByteArray(valuef);  
                connection.set(keyb, valueb);  
                return 1L;  
            }  
        });  
    }  
  
    private byte[] toByteArray(Object obj) {  
        byte[] bytes = null;  
        ByteArrayOutputStream bos = new ByteArrayOutputStream();  
        try {  
            ObjectOutputStream oos = new ObjectOutputStream(bos);  
            oos.writeObject(obj);  
            oos.flush();  
            bytes = bos.toByteArray();  
            oos.close();  
            bos.close();  
        } catch (IOException ex) {  
            ex.printStackTrace();  
        }  
        return bytes;  
    }  
  
    private Object toObject(byte[] bytes) {  
        Object obj = null;  
        try {  
            ByteArrayInputStream bis = new ByteArrayInputStream(bytes);  
            ObjectInputStream ois = new ObjectInputStream(bis);  
            obj = ois.readObject();  
            ois.close();  
            bis.close();  
        } catch (IOException ex) {  
            ex.printStackTrace();  
        } catch (ClassNotFoundException ex) {  
            ex.printStackTrace();  
        }  
        return obj;  
    }  
  
    @Override  
    public void evict(Object key) {  
        final String keyf = (String) key;  
        redisTemplate.execute(new RedisCallback<Long>() {  
            public Long doInRedis(RedisConnection connection)  
                    throws DataAccessException {
                return connection.del(keyf.getBytes());  
            }  
        });  
    }  
  
    @Override  
    public void clear() {  
        redisTemplate.execute(new RedisCallback<String>() {  
            public String doInRedis(RedisConnection connection)  
                    throws DataAccessException {
                connection.flushDb();  
                return "ok";  
            }  
        });  
    }

    @SuppressWarnings("unchecked")  
    @Override  
    public <T> T get(Object key, Class<T> type) {  
        final String keyf = (String) key;  
        Object object = null;  
        object = redisTemplate.execute(new RedisCallback<Object>() {  
            public Object doInRedis(RedisConnection connection) throws DataAccessException {
  
                byte[] key = keyf.getBytes();  
                byte[] value = connection.get(key);  
                if (value == null) {  
                    return null;  
                }  
                return toObject(value);  
            }  
        });  
        return (T) object;  
    }  
  
    @Override  
    public ValueWrapper putIfAbsent(Object key, Object value) {
        put(key, value);  
        return new SimpleValueWrapper(value);
    }  
    
	public void put(Object key, Object value, long expireTime){
    	final String keyf = (String) key;  
        final Object valuef = value;  
        final long liveTime = expireTime;  
    	
    	redisTemplate.execute(new RedisCallback<Long>() {
            public Long doInRedis(RedisConnection connection) throws DataAccessException {
            	byte[] keyb = keyf.getBytes();  
                byte[] valueb = toByteArray(valuef); 
                connection.set(keyb, valueb);
                
                if (liveTime > 0) {
                    connection.expire(keyb, liveTime);
                }
                return 1L;
            }
        });
    }
    
	public void setExpire(Object key, long expireTime){
    	final String keyf = (String) key;  
        final long liveTime = expireTime;  
        
    	redisTemplate.execute(new RedisCallback<Boolean>() {
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
            	byte[] keyb = keyf.getBytes();  
                if (liveTime > 0) {
                   return connection.expire(keyb, liveTime);
                }
                return Boolean.FALSE;
            }
        });
    }
	
	public Set<String> keys(String key){
		final String keyf = (String) key;  
		return redisTemplate.execute(new RedisCallback<Set<String>>() {
            public Set<String> doInRedis(RedisConnection connection) throws DataAccessException {
            	byte[] keyb = keyf.getBytes();  
            	Set<byte[]> keys = connection.keys(keyb);
            	
            	Set<String> set = new HashSet<String>();
            	for (byte[] bs : keys) {
            		set.add(new String(bs));
				}
                return set;
            }
        });
    }

	@Override
	public <T> T get(Object key, Callable<T> valueLoader) {
		// TODO Auto-generated method stub
		return null;
	}
}  