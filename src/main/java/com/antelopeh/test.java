package com.antelopeh;

//import com.alibaba.fastjson.JSON;
//import net.sourceforge.pinyin4j.PinyinHelper;
//import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
//import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
//import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
//import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;
//import org.apache.commons.io.FileUtils;
//import org.springframework.util.ResourceUtils;

import java.io.File;
import java.io.IOException;
import java.util.*;


class test {
    //使用volatile修饰的变量必须是成员变量
    volatile static List<String> list = new ArrayList<String>();
    public static void main(String[] args) throws ClassNotFoundException, InterruptedException, IOException {
//        String region = "{\"330100\":\"杭州市\",\n" +
//                "\"330200\":\"宁波市\",\n" +
//                "\"330300\":\"温州市\",\n" +
//                "\"330400\":\"嘉兴市\",\n" +
//                "\"330500\":\"湖州市\",\n" +
//                "\"330600\":\"绍兴市\",\n" +
//                "\"330700\":\"金华市\",\n" +
//                "\"330800\":\"衢州市\",\n" +
//                "\"330900\":\"舟山市\",\n" +
//                "\"331000\":\"台州市\",\n" +
//                "\"331100\":\"丽水市\"}";
//        String s = "{\"330102\":\"上城区\",\n" +
//                "\"330103\":\"下城区\",\n" +
//                "\"330104\":\"江干区\",\n" +
//                "\"330105\":\"拱墅区\",\n" +
//                "\"330106\":\"西湖区\",\n" +
//                "\"330108\":\"滨江区\",\n" +
//                "\"330109\":\"萧山区\",\n" +
//                "\"330110\":\"余杭区\",\n" +
//                "\"330111\":\"富阳区\",\n" +
//                "\"330112\":\"临安区\",\n" +
//                "\"330122\":\"桐庐县\",\n" +
//                "\"330127\":\"淳安县\",\n" +
//                "\"330182\":\"建德市\",\n" +
//                "\"330203\":\"海曙区\",\n" +
//                "\"330205\":\"江北区\",\n" +
//                "\"330206\":\"北仑区\",\n" +
//                "\"330211\":\"镇海区\",\n" +
//                "\"330212\":\"鄞州区\",\n" +
//                "\"330213\":\"奉化区\",\n" +
//                "\"330225\":\"象山县\",\n" +
//                "\"330226\":\"宁海县\",\n" +
//                "\"330281\":\"余姚市\",\n" +
//                "\"330282\":\"慈溪市\",\n" +
//                "\"330302\":\"鹿城区\",\n" +
//                "\"330303\":\"龙湾区\",\n" +
//                "\"330304\":\"瓯海区\",\n" +
//                "\"330305\":\"洞头区\",\n" +
//                "\"330324\":\"永嘉县\",\n" +
//                "\"330326\":\"平阳县\",\n" +
//                "\"330327\":\"苍南县\",\n" +
//                "\"330328\":\"文成县\",\n" +
//                "\"330329\":\"泰顺县\",\n" +
//                "\"330381\":\"瑞安市\",\n" +
//                "\"330382\":\"乐清市\",\n" +
//                "\"330383\":\"龙港市\",\n" +
//                "\"330402\":\"南湖区\",\n" +
//                "\"330411\":\"秀洲区\",\n" +
//                "\"330421\":\"嘉善县\",\n" +
//                "\"330424\":\"海盐县\",\n" +
//                "\"330481\":\"海宁市\",\n" +
//                "\"330482\":\"平湖市\",\n" +
//                "\"330483\":\"桐乡市\",\n" +
//                "\"330502\":\"吴兴区\",\n" +
//                "\"330503\":\"南浔区\",\n" +
//                "\"330521\":\"德清县\",\n" +
//                "\"330522\":\"长兴县\",\n" +
//                "\"330523\":\"安吉县\",\n" +
//                "\"330602\":\"越城区\",\n" +
//                "\"330603\":\"柯桥区\",\n" +
//                "\"330604\":\"上虞区\",\n" +
//                "\"330624\":\"新昌县\",\n" +
//                "\"330681\":\"诸暨市\",\n" +
//                "\"330683\":\"嵊州市\",\n" +
//                "\"330702\":\"婺城区\",\n" +
//                "\"330703\":\"金东区\",\n" +
//                "\"330723\":\"武义县\",\n" +
//                "\"330726\":\"浦江县\",\n" +
//                "\"330727\":\"磐安县\",\n" +
//                "\"330781\":\"兰溪市\",\n" +
//                "\"330782\":\"义乌市\",\n" +
//                "\"330783\":\"东阳市\",\n" +
//                "\"330784\":\"永康市\",\n" +
//                "\"330802\":\"柯城区\",\n" +
//                "\"330803\":\"衢江区\",\n" +
//                "\"330822\":\"常山县\",\n" +
//                "\"330824\":\"开化县\",\n" +
//                "\"330825\":\"龙游县\",\n" +
//                "\"330881\":\"江山市\",\n" +
//                "\"330902\":\"定海区\",\n" +
//                "\"330903\":\"普陀区\",\n" +
//                "\"330921\":\"岱山县\",\n" +
//                "\"330922\":\"嵊泗县\",\n" +
//                "\"331002\":\"椒江区\",\n" +
//                "\"331003\":\"黄岩区\",\n" +
//                "\"331004\":\"路桥区\",\n" +
//                "\"331022\":\"三门县\",\n" +
//                "\"331023\":\"天台县\",\n" +
//                "\"331024\":\"仙居县\",\n" +
//                "\"331081\":\"温岭市\",\n" +
//                "\"331082\":\"临海市\",\n" +
//                "\"331083\":\"玉环市\",\n" +
//                "\"331102\":\"莲都区\",\n" +
//                "\"331121\":\"青田县\",\n" +
//                "\"331122\":\"缙云县\",\n" +
//                "\"331123\":\"遂昌县\",\n" +
//                "\"331124\":\"松阳县\",\n" +
//                "\"331125\":\"云和县\",\n" +
//                "\"331126\":\"庆元县\",\n" +
//                "\"331127\":\"景宁畲族自治县\",\n" +
//                "\"331181\":\"龙泉市\"}";
//        Map maps = (Map) JSON.parse(s);
//        Map regionMap = (Map) JSON.parse(region);
//        Set set = maps.keySet();
//        Iterator iter = set.iterator();
//        String items = "";
//        int i = 1;
//        while (iter.hasNext()) {
//            String key = (String) iter.next();
////            String item = "UPDATE tab_county SET tower_county_code='"+key+"' WHERE county_nickname = '"+maps.get(key)+"';\n";
////            items += item;
//            File jsonFile = ResourceUtils.getFile("E:/workspace/data_location/code/"+key+".json");
//            String json = FileUtils.readFileToString(jsonFile);
//            Map imaps = (Map) JSON.parse(json);
//            Set iset = imaps.keySet();
//            Iterator iiter = iset.iterator();
//            while (iiter.hasNext()) {
//                String itemName = (String) iiter.next();
//                String regionCode;
//                if (!((String) regionMap.get(key.substring(0,4)+"00")).substring(0,2).equals("湖州"))
//                    regionCode = getFirstSpell(((String) regionMap.get(key.substring(0,4)+"00")).substring(0,2));
//                else
//                    regionCode = "HU";
//                String item = "INSERT INTO tab_town VALUES (" + i + ",\"" +regionCode+ "\",\"" +  getFirstSpell((String) maps.get(key)).substring(0,2) + "\",\"" + getFirstSpell((String) imaps.get(itemName)) + "\",\""+imaps.get(itemName)+"\",\""+imaps.get(itemName)+"\",\""+itemName+"\");";
//                items = items + "\n" + item;
//                System.out.println(item);
//                i++;
//            }
//// printkey
//        }
//        System.out.println(s);

//    }

//    public static String getFirstSpell(String chinese) {
//        StringBuffer pybf = new StringBuffer();
//        char[] arr = chinese.toCharArray();
//        HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();
//        defaultFormat.setCaseType(HanyuPinyinCaseType.UPPERCASE);
//        defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
//        for (int i = 0; i < arr.length; i++) {
//            if (arr[i] > 128) {
//                try {
//                    String[] temp = PinyinHelper.toHanyuPinyinStringArray(arr[i], defaultFormat);
//                    if (temp != null && temp.length > 0) {
//                        pybf.append(temp[0].charAt(0));
//                    }
//                } catch (BadHanyuPinyinOutputFormatCombination e) {
//                    e.printStackTrace();
//                }
//            } else {
//                pybf.append(arr[i]);
//            }
//        }
//        return pybf.toString().replaceAll("\\W", "").trim();
//    }


        for (int j = 0; j <100; j++){
            Object o = new Object();

            for (int i = 0; i < 5; i++)
                list.add("num" + i);

            Thread thread1 = new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int i = list.size() - 1; i >= 0; i--)
                        list.remove(i);
                }
            });
            Thread thread2 = new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int i = 0; i < list.size(); i++) {
                        System.out.println(list.get(i));
                    }
                }
            });

            thread1.start();
            thread2.start();
            System.out.println("---------------------------");
        }


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