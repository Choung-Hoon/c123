package c123;

import java.security.NoSuchAlgorithmException;
import lee.common.util.MD5Cryptor;

public class PwdTest {

  public static void main(String[] args) throws NoSuchAlgorithmException {
    // TODO Auto-generated method stub
    System.out.println(MD5Cryptor.getMD5Crypt("1234"));
  }

}
