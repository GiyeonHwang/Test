package ajaxtest;
public @interface RequestMapping {

<select id="checkId"
    parameterType="project.jyland.member.model.JYUser"
    resultType="java.lang.Integer">
    SELECT NVL(COUNT(*),0)
    FROM JYUSER WHERE ID=#{id}
</select>

}
