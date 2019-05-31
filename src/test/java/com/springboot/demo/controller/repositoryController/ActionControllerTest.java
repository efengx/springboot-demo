package com.springboot.demo.controller.repositoryController;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import sun.misc.IOUtils;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest
@WebAppConfiguration
public class ActionControllerTest {

    @Autowired
    private WebApplicationContext wac;
    private MockMvc mockMvc;

    @Value("classpath:testcase.json")
    private Resource testcase;

    @Value("classpath:smapleupload.json")
    private Resource smapleupload;

    @Value("classpath:smapleupload2.json")
    private Resource smapleupload2;

    @Before
    public void setupMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

/**
 * create testaction
 */

    @Test
    public void smapleupload2() throws Exception {
        String json = new String(IOUtils.readFully(smapleupload2.getInputStream(), -1, true));
        mockMvc.perform
                (
                        put("/action/batch/4")
                                .contentType(MediaType.APPLICATION_JSON_UTF8)
                                .content(json.getBytes())
                )
                .andExpect(status().isOk())
                .andDo(print());
    }

    @Test
    public void smapleupload() throws Exception {
        String json = new String(IOUtils.readFully(smapleupload.getInputStream(), -1, true));
        mockMvc.perform
                (
                        put("/action/batch/4")
                                .contentType(MediaType.APPLICATION_JSON_UTF8)
                                .content(json.getBytes())
                )
                .andExpect(status().isOk())
                .andDo(print());
    }
//
//    @Test
//    public void create1() throws Exception {
//        String json = new String(IOUtils.readFully(testcase.getInputStream(), -1, true));
//        mockMvc.perform
//                (
//                        put("/action/batch/4")
//                                .contentType(MediaType.APPLICATION_JSON_UTF8)
//                                .content(json.getBytes())
//                )
//                .andExpect(status().isOk())
//                .andDo(print());
//    }

    @Test
    public void findForArray() throws Exception {
        mockMvc.perform
            (
                get("/action/search/4/findForArray")
                .contentType(MediaType.APPLICATION_JSON_UTF8)
            )
            .andExpect(status().isOk())
            .andDo(print());
    }
}