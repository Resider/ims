package org.ims.pojo.entity;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.NullSerializer;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;

/**
 * @author renz
 * @version 1.0
 * @date 2021/5/12 14:42
 */
@Data
public class TestEntity implements Serializable {

    private static final long serialVersionUID = 2254030662606117202L;

    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;

    private String name;

    public TestEntity(Long id, String name) {
        this.id = id;
        this.name = name;
    }
}
