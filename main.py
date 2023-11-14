import flet as ft
import paramiko as pa
import psycopg2
import logging

logging.basicConfig(level=logging.DEBUG, filename='log.log',
                    format='%(levelname)s (%(asctime)s): %(message)s (Line: %(lineno)d) [%(filename)s]',
                    datefmt='%d/%m/%Y %I:%M:%S',
                    encoding = 'utf-8', filemode='w')

def main(page: ft.Page):

    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.MainAxisAlignment.CENTER
    login = ft.TextField(label="Login", autofocus=True)
    password = ft.TextField(label="Password")
    port = ft.TextField(label="Port")
    ip = ft.TextField(label="IP")
    page.title = "Scan OS"
    page.window_width = 500
    page.window_height = 500
    page.window_resizable = False

    dlg_successfully = ft.AlertDialog(
        title=ft.Text(value="Successfully", text_align=ft.TextAlign.CENTER))

    def btn_click(e):
        try:
            client = pa.SSHClient()
            client.set_missing_host_key_policy(pa.AutoAddPolicy())
            client.connect(hostname=ip.value, username=login.value,
                           password=password.value, port=int(port.value),
                           look_for_keys=False, allow_agent=False)
            stdin, stdout, stderr = client.exec_command('hostnamectl')
            info = str(stdout.read()) + str(stderr.read())
            lst = info.split(sep=r"\n")
            lst[0] = lst[0][2:]
            lst.pop(-1)
            result_str = ""
            for row in lst:
                if row != lst[-1]:
                    result_str += row + " "

            connect_db = psycopg2.connect(dbname="scan_os",
                                          user="postgres",
                                          password="kali",
                                          host="localhost",
                                          port="5433")

            cursor = connect_db.cursor()

            data = (ip.value, login.value, result_str)

            cursor.execute("INSERT INTO result_scan (host_ip, login, info_about_os) "
                           "VALUES (%s, %s, %s)", data)
            connect_db.commit()
            cursor.close()
            client.close()

            page.dialog = dlg_successfully
            dlg_successfully.open = True
            page.update()

        except Exception as e:
            dlg_error = ft.AlertDialog(
                title=ft.Text("Error" + str(e)))
            page.dialog = dlg_error
            dlg_error.open = True
            page.update()
            logging.exception(e)

    page.add(
        login,
        password,
        port,
        ip,
        ft.ElevatedButton("Scan", on_click=btn_click),
    )


ft.app(target=main)

