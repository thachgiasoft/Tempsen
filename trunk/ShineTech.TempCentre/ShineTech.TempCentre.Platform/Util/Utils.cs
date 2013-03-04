﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Drawing;
using System.Xml;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.IO;

namespace ShineTech.TempCentre.Platform
{
    public class Utils
    {
        /// <summary>
        /// 将二进制数据转换成图片
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static System.Drawing.Image ReadSource(byte []data)
        {
            System.IO.MemoryStream ms = new System.IO.MemoryStream(data, 0, data.Length, true, true);
            return System.Drawing.Image.FromStream(ms);
        }
        /// <summary>
        /// 将图片转换成二进制
        /// </summary>
        /// <param name="image">图片</param>
        /// <returns></returns>
        public static  byte[] CopyToBinary(Image image)
        {
            System.IO.MemoryStream ms=new System.IO.MemoryStream();
            image.Save(ms,System.Drawing.Imaging.ImageFormat.Png);
            byte [] data=new byte[ms.Length];
            ms.Position=0;
            ms.Read(data,0,data.Length);
            return data;
        }
        public static string ReadKeyFromXML()
        {
            string path = "srcsafe.xml";
            if (File.Exists(path))
            {
                var v = from c in XElement.Load(path).Descendants("dbconfig").Elements()
                        where c.Name == "key"
                        select c;
                string key = "";
                foreach (string i in v)
                    key = i;
                return key;
            }
            else
                return "";
        }
        public static string ReadPwdFromXML()
        {
            string path = "srcsafe.xml";
            if (File.Exists(path))
            {
                var v = from c in XElement.Load(path).Descendants("dbconfig").Elements()
                        where c.Name == "pwd"
                        select c;
                string key = "";
                foreach (string i in v)
                    key = i;
                return key;
            }
            return "";
        }
        public static string ReadIVFromXML()
        {
            string path = "srcsafe.xml";
            if (File.Exists(path))
            {
                var v = from c in XElement.Load(path).Descendants("dbconfig").Elements()
                        where c.Name == "iv"
                        select c;
                string key = "";
                foreach (string i in v)
                    key = i;
                return key;
            }
            else
                return "";
        }
        
        public static string Encode(string plaintext, byte[] key, byte[] iv)
        {
            byte[] plain=Encoding.Default.GetBytes(plaintext);
            //using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
            //{
            //    using (TripleDESCryptoServiceProvider provider = new TripleDESCryptoServiceProvider())
            //    {
            //        using (CryptoStream crypto = new CryptoStream(ms, provider.CreateEncryptor(key, iv), CryptoStreamMode.Write))
            //        {
            //            crypto.Write(plain, 0, plain.Length);
            //            return ms.ToArray();
            //        }
            //    }
            //}
            return plaintext;
          
        }
        public static string Decode(string encypttext,string key,string iv)
        {
            //string a = Encoding.Default.GetString(Convert.FromBase64String(encypttext));
            //byte[] plain = Encoding.Default.GetBytes(Encoding.Default.GetString(Convert.FromBase64String(encypttext)));
            //byte[] plain = Convert.FromBase64String(encypttext);            
            //using (System.IO.MemoryStream ms = new System.IO.MemoryStream(plain))
            //{
            //    using (TripleDESCryptoServiceProvider provider = new TripleDESCryptoServiceProvider())
            //    {
            //        using (CryptoStream crypto = new CryptoStream(ms, provider.CreateDecryptor(Convert.FromBase64String(key), Convert.FromBase64String(iv)), CryptoStreamMode.Read))
            //        {
            //            byte[] decode = new byte[plain.Length];
            //            crypto.Read(decode, 0, decode.Length);
            //            return Convert.ToBase64String(decode);
            //        }
            //    }
            //}
            return encypttext;
        }
        public static string GenerateGuid()
        {
            return System.Guid.NewGuid().ToString();
        }
        /// <summary>
        /// 写入XML配置文件
        /// </summary>
        /// <returns></returns>
        public static bool WriteToXML()
        {
            if (!File.Exists("srcsafe.xml"))
            {
                TripleDESCryptoServiceProvider des = new TripleDESCryptoServiceProvider();
                string key = Convert.ToBase64String(des.Key);
                string iv = Convert.ToBase64String(des.IV);
                //string plaintext = Convert.ToBase64String(Encoding.Default.GetBytes(GenerateGuid().Substring(0, 8)));
                string plaintext = GenerateGuid();
                string pwd = Encode(plaintext, des.Key, des.IV);
                XElement config = new XElement("system", new XElement("dbconfig"
                                                                                 , new XElement("key", key)
                                                                                 , new XElement("iv", iv)
                                                                                 , new XElement("pwd", pwd)
                                                                                 ));
                config.Save("srcsafe.xml");
                return true;
            }
            else
                return false;
           
        }

        /// <summary>
        /// 读取文件到内存中
        /// </summary>
        /// <param name="path">文件</param>
        /// <returns>content</returns>
        public static string Read(string path)
        {
            if (!File.Exists(path))
            {
                Console.WriteLine("{0} does not exist.", path);
                return "";
            }
            using (StreamReader sr = File.OpenText(path))
            {
                string input;
                StringBuilder sb = new StringBuilder();
                while ((input = sr.ReadLine()) != null)
                {
                    sb.AppendLine(input);
                }
                sr.Close();
                return sb.ToString();
            }
        }
    }
}
