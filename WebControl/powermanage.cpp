#include <QQmlContext>
//#include "windows.h"
#include "powermanage.h"

PowerManage * __PowerManage = Q_NULLPTR;

QObject *PowerManage_singletontype_provider(QQmlEngine *engine, QJSEngine *scriptEngine)
{
    Q_UNUSED(engine)
    Q_UNUSED(scriptEngine)

    // auto deleted
    __PowerManage = new PowerManage;

    return __PowerManage;
}

PowerManage::PowerManage(QObject *parent) : QObject(parent)
{

}


bool PowerManage::shutDown()
{
//    HANDLE hToken;
//    TOKEN_PRIVILEGES tkp;

//    //获取进程标志
//    if (!OpenProcessToken(GetCurrentProcess(), TOKEN_ADJUST_PRIVILEGES | TOKEN_QUERY, &hToken))
//         return false;

//    //获取关机特权的LUID
//    LookupPrivilegeValue(NULL, SE_SHUTDOWN_NAME,    &tkp.Privileges[0].Luid);
//    tkp.PrivilegeCount = 1;
//    tkp.Privileges[0].Attributes = SE_PRIVILEGE_ENABLED;

//    //获取这个进程的关机特权
//    AdjustTokenPrivileges(hToken, false, &tkp, 0, (PTOKEN_PRIVILEGES)NULL, 0);
//    if (GetLastError() != ERROR_SUCCESS) return false;

//    // 强制关闭计算机
//    if ( !ExitWindowsEx(EWX_SHUTDOWN | EWX_FORCE, 0))
//          return false;
    return true;
}

bool PowerManage::sleep()
{
    system("shutdown -h");
    return true;
}

bool PowerManage::restart()
{
    system("shutdown -r");
    return true;
}

bool PowerManage::logout()
{
    system("shutdown -l");
    return true;
}
