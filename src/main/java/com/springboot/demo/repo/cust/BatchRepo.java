package com.springboot.demo.repo.cust;

import java.util.List;

public interface BatchRepo<T, TD> {

    Integer batchInsert(List<T> list);

    Integer batchUpdate(List<T> list);

    Integer batchSave(List<T> list);

}
