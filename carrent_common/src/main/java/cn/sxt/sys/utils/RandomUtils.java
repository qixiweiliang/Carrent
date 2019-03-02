package cn.sxt.sys.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

/**
 * @program: SSM_upload_and_Dowlond
 * @Date: 2019/1/10 11:40
 * @Author: Mr.Wen
 * @Description:
 */
public class RandomUtils {
    private static SimpleDateFormat sm = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    private static SimpleDateFormat sm2 = new SimpleDateFormat("yyyy-MM-dd");
    private static Random random = new Random();

    /**
     *
     * @param oldName
     * @return newName
     * @Description: 根据老名字生成新的文件名  yyyyMMddHHmmssSSS[].PNG年月日时分秒毫秒+四位随机数+后缀名
     *
     */
    public static String createFileNameUseTime(String oldName) {
        String suffix = oldName.substring(oldName.lastIndexOf("."));
        String time = sm.format(new Date());
        Integer num = random.nextInt(9000) + 1000; //最大8999 最小0 最大9999 最小1000
        return time+num +suffix;
    }

    /**
     *  根据老名字生成新的文件名  UUID+后缀名
     * @param oldName
     * @return
     */

    public static String createFileNameUseUUID(String oldName) {
        String suffix = oldName.substring(oldName.lastIndexOf("."));//,oldName.length()
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        return uuid+suffix;
    }

    public static String createDirNameUseTime (){
        String timDir = sm2.format(new Date());
        return timDir;
    }

    /**
     * @param args
     */
    // public static void main(String[] args) {
    //     String nameUseTime = createFileNameUseTime("hjfiaojftoipajfopiawjpoi.jsp");
    //     String nameUseUUID = createFileNameUseUUID("hjfiaojftoipajfopiawjpoi.jsp");
    //     System.out.println(nameUseTime);
    //     System.out.println(nameUseUUID);
    // }
}
