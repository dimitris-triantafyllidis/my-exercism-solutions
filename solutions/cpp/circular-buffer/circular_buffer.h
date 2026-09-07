#pragma once

#include <vector>
#include <stdexcept>

namespace circular_buffer {

    template<typename T>
    class circular_buffer {

    public:

        circular_buffer(std::size_t capacity);

        auto read() -> T;
        auto write(const T &value) -> void;
        auto overwrite(const T &value) -> void;
        auto clear() -> void;

    private:

        std::vector<T> m_e;

        std::size_t m_idx_front = 0;
        std::size_t m_idx_back = 0;
        std::size_t m_size = 0;

    };

    template<typename T>
    circular_buffer<T>::circular_buffer(std::size_t capacity)
    : m_e(capacity)
    {}

    template<typename T>
    auto circular_buffer<T>::read() -> T {
        if (m_size == 0) {
            throw std::domain_error("");
        }
        else {
            T e = m_e[m_idx_back];
            if (m_idx_back == m_e.size() - 1) {
                m_idx_back = 0;
            }
            else {
                m_idx_back++;
            }
            m_size--;
            return e;
        }
    }

    template<typename T>
    auto circular_buffer<T>::write(const T &value) -> void {
        if (m_size == m_e.size()) {
            throw std::domain_error("");
        }
        else {
            m_e[m_idx_front] = value;
            if (m_idx_front == m_e.size() - 1) {
                m_idx_front = 0;
            }
            else {
                m_idx_front++;
            }
            m_size++;
        }
    }

    template<typename T>
    auto circular_buffer<T>::overwrite(const T &value) -> void {
        if (m_size < m_e.size()) {
            write(value);
        }
        else {
            m_e[m_idx_front] = value;
            if (m_idx_front == m_e.size() - 1) {
                m_idx_front = 0;
            }
            else {
                m_idx_front++;
            }
            if (m_idx_back == m_e.size() - 1) {
                m_idx_back = 0;
            }
            else {
                m_idx_back++;
            }
        }
    }

    template<typename T>
    auto circular_buffer<T>::clear() -> void {
        m_idx_front = 0;
        m_idx_back = 0;
        m_size = 0;
    }

}  // namespace circular_buffer

