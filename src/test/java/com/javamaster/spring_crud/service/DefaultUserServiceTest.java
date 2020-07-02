package com.javamaster.spring_crud.service;

import com.javamaster.spring_crud.dto.UserDto;
import com.javamaster.spring_crud.entity.User;
import com.javamaster.spring_crud.exception.ValidationException;
import com.javamaster.spring_crud.repository.UserRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class DefaultUserServiceTest {

    private UserService userService;
    private UserRepository userRepository;
    private UserConverter userConverter;
    private User user;

    @BeforeEach
    void setUp() {
        userRepository = mock(UserRepository.class);
        userConverter = new UserConverter();
        User user = new User();
        user.setName("testName");
        user.setLogin("testLogin");
        user.setId(1);
        when(userRepository.save(any())).thenReturn(user);
        userService = new DefaultUserService(userRepository, userConverter);

    }

    @Test
    void saveUserReturnUserDto() throws ValidationException {
        UserDto userDto = UserDto.builder().login("testLogin").build();
        UserDto savedUserDto = userService.saveUser(userDto);

        assertThat(savedUserDto).isNotNull();
        assertThat(savedUserDto.getLogin()).isEqualTo("testLogin");
    }

    @Test
    void saveUserWithNullLoginThrowsValidationException(){
        UserDto userDto = UserDto.builder().build();

        assertThrows(ValidationException.class, () -> userService.saveUser(userDto), "Login is empty.");
    }
}