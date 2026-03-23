//版权声明
//本软件由作者:灵枢 开发，仅供学习交流使用
//严禁任何形式的非法破解、反编译、逆向工程等行为
//使用者应当遵守相关法律法规，尊重知识产权
//作者:灵枢 保留所有权利

package com.lingshu.ima;

import com.lingshu.ima.ui.UnifiedMainFrame;

import javax.swing.*;

//版权声明
//本软件由作者:灵枢 开发，仅供学习交流使用
//严禁任何形式的非法破解、反编译、逆向工程等行为
//使用者应当遵守相关法律法规，尊重知识产权
//作者:灵枢 保留所有权利

public class Main {
    
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            try {
                UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
            } catch (Exception e) {
                e.printStackTrace();
            }
            
            setApplicationIcon();
            
            UnifiedMainFrame frame = new UnifiedMainFrame();
            frame.setVisible(true);
        });
    }
    
    private static void setApplicationIcon() {
        try {
            java.net.URL iconUrl = Main.class.getClassLoader().getResource("icon/icon_256.png");
            if (iconUrl != null) {
                java.awt.Image icon = new ImageIcon(iconUrl).getImage();
                java.util.List<java.awt.Image> icons = new java.util.ArrayList<>();
                icons.add(icon);
                java.awt.Taskbar.getTaskbar().setIconImage(icon);
            }
        } catch (Exception e) {
            System.err.println("设置应用程序图标失败: " + e.getMessage());
        }
    }
    
    //版权声明
    //本软件由作者:灵枢 开发，仅供学习交流使用
    //严禁任何形式的非法破解、反编译、逆向工程等行为
    //使用者应当遵守相关法律法规，尊重知识产权
    //作者:灵枢 保留所有权利
}
