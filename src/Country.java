/**
 * Created by Nilucshan on 5/16/2018.
 */

import java.util.Map;
import java.util.Set;

public class Country {

    private Map<String,Object> info;
    private  Map<String,Map<String,Object>> innings;

    public Map<String, Object> getInfo() {
        return info;
    }

    public void setInfo(Map<String, Object> info) {
        this.info = info;
    }


    public Map<String, Map<String, Object>> getInnings() {
        return innings;
    }

    public void setInnings(Map<String, Map<String, Object>> innings) {
        this.innings = innings;
    }
}
