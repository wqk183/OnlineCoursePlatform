package OCP.util;

public class SplitPage {
    //分页请求时,请求标识参数
    final public static String FIRSTPAGE = "first";//请求第一页
    final public static String PREVIOUSEPAGE = "previous";//请求上一页
    final public static String NEXTPAGE = "next";//请求下一页
    final public static String LASTPAGE = "last";//请求最后一页
    private int pageRows = 10;//每页显示记录数,默认10条,可以在页面设置
    private int totalRows = 0;//总的记录数,这个参数由NoteDAO对象提供
    private int currentPage = 1;//当前显示的页面编号,默认第一页
    private int firstPage = 1;//首页位置,默认第一页
    private int totalPages = 1;//总的页面数量,默认就一页

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getFirstPage() {
        return firstPage;
    }

    public void setFirstPage(int firstPage) {
        this.firstPage = firstPage;
    }

    public int getPageRows() {
        return pageRows;
    }

    public void setPageRows(int pageRows) {
        if(pageRows==0)throw new ArithmeticException();
        this.pageRows = pageRows;//如果pageRows被设置为零,应当抛出异常.
        //修改每页显示记录数,将会直接影响总页面数,所以要同时修改
        this.totalPages=(this.totalRows%this.pageRows==0)?this.totalRows/this.pageRows:this.totalRows/this.pageRows+1;
    }

    public int getTotalRows() {
        return totalRows;
    }

    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
        //计算总的页面数(或最后的页面号),两个整数相除如果刚好除尽,值就是相除后的商,否则如果有余数,商应当还加1.
        this.totalPages=(this.totalRows%this.pageRows==0)?this.totalRows/this.pageRows:this.totalRows/this.pageRows+1;
    }

    public int getTotalPages() {
        return totalPages;
    }

    //核心方法,实现分页显示功能. Flag为请求标识参数
    public int confirmPage(String flag) {
        int newPage=this.currentPage;
        if(flag!=null){
            if(flag.equals(SplitPage.FIRSTPAGE)){
                newPage=1;
            }else if(flag.equals(SplitPage.LASTPAGE)){
                newPage=this.totalPages;
            }else if(flag.equals(SplitPage.NEXTPAGE)){
                newPage=(this.totalPages==this.currentPage)?this.currentPage:this.currentPage+1;
            }else if(flag.equals(SplitPage.PREVIOUSEPAGE)){
                newPage=(this.firstPage==this.currentPage)?this.currentPage:this.currentPage-1;
            }else{//否则是一个数字字符串
                int tpage=Integer.parseInt(flag.trim());
                newPage=tpage;
            }
        }else{//如果请求标识参数为空,那么当前页码不变
            newPage=this.currentPage;
        }
        //在返回前设置当前页面
        this.setCurrentPage(newPage);
        return newPage;
    }

}