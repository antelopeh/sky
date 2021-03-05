package com.antelopeh.core.util;

import java.lang.reflect.Field;

public class ObjectUtils {
    /*
        判断某个实体类全部变量是否都为空
     */
    public static boolean isObjectFieldEmpty(Object object) {
        boolean flag = true;
        if (object != null) {
            Class<?> entity = object.getClass();
            Field[] fields = entity.getDeclaredFields();//获取该类的所有成员变量（私有的）
            for (Field field : fields) {
                if (field.getName().equals("serialVersionUID"))
                    continue;
                try {
                    field.setAccessible(true);
                    if (field.get(object) != null && !"".equals(field.get(object))) {
                        flag = false;
                        break;
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        }
        return flag;
    }
}
