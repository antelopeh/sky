package com.antelopeh;

import java.util.*;


class test {
    //使用volatile修饰的变量必须是成员变量
    volatile static List<String> list = new ArrayList<String>();
    public static void main(String[] args) throws ClassNotFoundException, InterruptedException {
//        for (int j = 0; j <100; j++){
//            Object o = new Object();
//
//            for (int i = 0; i < 5; i++)
//                list.add("num" + i);
//
//            Thread thread1 = new Thread(new Runnable() {
//                @Override
//                public void run() {
//                    for (int i = list.size() - 1; i >= 0; i--)
//                        list.remove(i);
//                }
//            });
//            Thread thread2 = new Thread(new Runnable() {
//                @Override
//                public void run() {
//                    for (int i = 0; i < list.size(); i++) {
//                        System.out.println(list.get(i));
//                    }
//                }
//            });
//
//            thread1.start();
//            thread2.start();
//            System.out.println("---------------------------");
//        }


        test stu = new test();
        new Thread(stu::function1,"线程 1").start();
        new Thread(stu::function2,"线程 2").start();
        Thread.sleep(2000);
    }

    private synchronized void function1()  {
        System.out.println(Thread.currentThread().getName()+"执行\t 进入function1");
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        function2();
    }

    private void function2() {
        System.out.println(Thread.currentThread().getName()+"执行\t 进入function2");
        synchronized (this){
            System.out.println(Thread.currentThread().getName()+"执行\t function2同步体");
        }
    }
    /*
    线程 1执行	 进入function1
    线程 2执行	 进入function2
    线程 1执行	 进入function2
    线程 1执行	 function2同步体
    线程 2执行	 function2同步体
     */
}