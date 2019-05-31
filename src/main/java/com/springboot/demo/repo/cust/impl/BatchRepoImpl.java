package com.springboot.demo.repo.cust.impl;

import com.springboot.demo.repo.cust.BatchRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

@Repository
public class BatchRepoImpl<T, TD> implements BatchRepo<T, TD> {

    @Autowired
    private EntityManager em;

    @Override
    @Transactional
    public Integer batchInsert(List<T> list) {
        list.forEach(item -> em.persist(item));
        em.flush();
        em.clear();
        return list.size();
    }

    @Override
    @Transactional
    public Integer batchUpdate(List<T> list) {
        list.forEach(item -> em.merge(item));
        em.flush();
        em.clear();
        return list.size();
    }

    @Override
    @Transactional
    public Integer batchSave(List<T> list) {

        return null;
    }
}
