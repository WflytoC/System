package handler.connect;

import result.ContentResult;
import result.StructureResult;
import result.URLResult;

/**
 * Created by wcshi on 2017/5/15.
 */
public class ConnectModules {
    public static boolean judgeIsNewsPage(URLResult urlResult, ContentResult contentResult, StructureResult structureResult) {
        //文章结构类型
        boolean newsStructure = ((structureResult.isContainsH1() && !structureResult.isH1ContainsElements()) || (structureResult.isContainsH2() && !structureResult.isH2ContainsElements())) && structureResult.isWebPattern();
        System.out.println("newsStructure = " + newsStructure);
        //处理内容属性和URL属性
        //排除非新闻情况
        if (urlResult.isContainsKeywordOfNotNews() && !urlResult.isContainsKeywordOfNews()) {
            return false;
        }
        if (newsStructure) {
            if (urlResult.isContainsKeywordOfNews()) {
                if (urlResult.isContainsDateIndicator() || urlResult.isLastPartEnoughLong()) {
                    return true;
                } else {
                    return false;
                }
            } else {
                if ((urlResult.isContainsDateIndicator() && urlResult.isLastPartEnoughLong()) && (contentResult.isContainsKeywordOfNews() || !contentResult.isContainsKeywordOfNotNews())) {
                    return true;
                } else {
                    return false;
                }
            }
        } {
            return false;
        }
    }
}
