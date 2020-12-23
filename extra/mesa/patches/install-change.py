--- a/bin/install_megadrivers.py
+++ b/bin/install_megadrivers.py
@@ -58,26 +58,26 @@
         print('installing {} to {}'.format(args.megadriver, abs_driver))
         os.link(master, abs_driver)
 
-        try:
-            ret = os.getcwd()
-            os.chdir(to)
+#        try:
+#            ret = os.getcwd()
+#            os.chdir(to)
+#
+#            name, ext = os.path.splitext(driver)
+#            while ext != '.so':
+#                if os.path.lexists(name):
+#                    os.unlink(name)
+#                os.symlink(driver, name)
+#                name, ext = os.path.splitext(name)
+#        finally:
+#        os.chdir(ret)
 
-            name, ext = os.path.splitext(driver)
-            while ext != '.so':
-                if os.path.lexists(name):
-                    os.unlink(name)
-                os.symlink(driver, name)
-                name, ext = os.path.splitext(name)
-        finally:
-            os.chdir(ret)
-
-    # Remove meson-created master .so and symlinks
-    os.unlink(master)
-    name, ext = os.path.splitext(master)
-    while ext != '.so':
-        if os.path.lexists(name):
-            os.unlink(name)
-        name, ext = os.path.splitext(name)
+#    # Remove meson-created master .so and symlinks
+#    os.unlink(master)
+#    name, ext = os.path.splitext(master)
+#    while ext != '.so':
+#        if os.path.lexists(name):
+#            os.unlink(name)
+#        name, ext = os.path.splitext(name)
 
 
 if __name__ == '__main__':
