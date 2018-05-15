/**
 * Created by Nilucshan on 5/15/2018.
 */

import java.io.File;

import org.apache.commons.lang3.builder.ReflectionToStringBuilder;

import org.apache.commons.lang3.builder.ToStringStyle;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

public class ExtractYamlData {

    public static void main(String[] args) {

        ObjectMapper mapper = new ObjectMapper(new YAMLFactory());

        try {

            User user = mapper.readValue(new File("user.yaml"), User.class);

            System.out.println(ReflectionToStringBuilder.toString(user,ToStringStyle.MULTI_LINE_STYLE));

        } catch (Exception e) {

            // TODO Auto-generated catch block

            e.printStackTrace();

        }

    }

}
