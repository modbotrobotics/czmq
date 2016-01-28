################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################

module CZMQ
  module FFI

    # extended generic list container
    # @note This class is 100% generated using zproject.
    class Zlistx
      # Raised when one tries to use an instance of {Zlistx} after
      # the internal pointer to the native object has been nullified.
      class DestroyedError < RuntimeError; end

      # Boilerplate for self pointer, initializer, and finalizer
      class << self
        alias :__new :new
      end
      # Attaches the pointer _ptr_ to this instance and defines a finalizer for
      # it if necessary.
      # @param ptr [::FFI::Pointer]
      # @param finalize [Boolean]
      def initialize(ptr, finalize = true)
        @ptr = ptr
        if @ptr.null?
          @ptr = nil # Remove null pointers so we don't have to test for them.
        elsif finalize
          @finalizer = self.class.create_finalizer_for @ptr
          ObjectSpace.define_finalizer self, @finalizer
        end
      end
      # @param ptr [::FFI::Pointer]
      # @return [Proc]
      def self.create_finalizer_for(ptr)
        Proc.new do
          ptr_ptr = ::FFI::MemoryPointer.new :pointer
          ptr_ptr.write_pointer ptr
          ::CZMQ::FFI.zlistx_destroy ptr_ptr
        end
      end
      # @return [Boolean]
      def null?
        !@ptr or @ptr.null?
      end
      # Return internal pointer
      # @return [::FFI::Pointer]
      def __ptr
        raise DestroyedError unless @ptr
        @ptr
      end
      # So external Libraries can just pass the Object to a FFI function which expects a :pointer
      alias_method :to_ptr, :__ptr
      # Nullify internal pointer and return pointer pointer.
      # @note This detaches the current instance from the native object
      #   and thus makes it unusable.
      # @return [::FFI::MemoryPointer] the pointer pointing to a pointer
      #   pointing to the native object
      def __ptr_give_ref
        raise DestroyedError unless @ptr
        ptr_ptr = ::FFI::MemoryPointer.new :pointer
        ptr_ptr.write_pointer @ptr
        __undef_finalizer if @finalizer
        @ptr = nil
        ptr_ptr
      end
      # Undefines the finalizer for this object.
      # @note Only use this if you need to and can guarantee that the native
      #   object will be freed by other means.
      # @return [void]
      def __undef_finalizer
        ObjectSpace.undefine_finalizer self
        @finalizer = nil
      end

      # Create a new callback of the following type:
      # Destroy an item
      #     typedef void (zlistx_destructor_fn) (
      #         void **item);                    
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.destructor_fn
        ::FFI::Function.new :void, [:pointer], blocking: true do |item|
          result = yield item
          result
        end
      end

      # Create a new callback of the following type:
      # Duplicate an item
      #     typedef void * (zlistx_duplicator_fn) (
      #         const void *item);                 
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.duplicator_fn
        ::FFI::Function.new :pointer, [:pointer], blocking: true do |item|
          result = yield item
          result
        end
      end

      # Create a new callback of the following type:
      # Compare two items, for sorting
      #     typedef int (zlistx_comparator_fn) (      
      #         const void *item1, const void *item2);
      #
      # @note WARNING: If your Ruby code doesn't retain a reference to the
      #   FFI::Function object after passing it to a C function call,
      #   it may be garbage collected while C still holds the pointer,
      #   potentially resulting in a segmentation fault.
      def self.comparator_fn
        ::FFI::Function.new :int, [:pointer, :pointer], blocking: true do |item1, item2|
          result = yield item1, item2
          result = Integer(result)
          result
        end
      end

      # Create a new, empty list.
      # @return [CZMQ::Zlistx]
      def self.new()
        ptr = ::CZMQ::FFI.zlistx_new()
        __new ptr
      end

      # Destroy a list. If an item destructor was specified, all items in the
      # list are automatically destroyed as well.                            
      #
      # @return [void]
      def destroy()
        return unless @ptr
        self_p = __ptr_give_ref
        result = ::CZMQ::FFI.zlistx_destroy(self_p)
        result
      end

      # Add an item to the head of the list. Calls the item duplicator, if any,
      # on the item. Resets cursor to list head. Returns an item handle on     
      # success, NULL if memory was exhausted.                                 
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [::FFI::Pointer]
      def add_start(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_add_start(self_p, item)
        result
      end

      # Add an item to the tail of the list. Calls the item duplicator, if any,
      # on the item. Resets cursor to list head. Returns an item handle on     
      # success, NULL if memory was exhausted.                                 
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [::FFI::Pointer]
      def add_end(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_add_end(self_p, item)
        result
      end

      # Return the number of items in the list
      #
      # @return [Integer]
      def size()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_size(self_p)
        result
      end

      # Return first item in the list, or null, leaves the cursor
      #
      # @return [::FFI::Pointer]
      def head()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_head(self_p)
        result
      end

      # Return last item in the list, or null, leaves the cursor
      #
      # @return [::FFI::Pointer]
      def tail()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_tail(self_p)
        result
      end

      # Return the item at the head of list. If the list is empty, returns NULL.
      # Leaves cursor pointing at the head item, or NULL if the list is empty.  
      #
      # @return [::FFI::Pointer]
      def first()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_first(self_p)
        result
      end

      # Return the next item. At the end of the list (or in an empty list),     
      # returns NULL. Use repeated zlistx_next () calls to work through the list
      # from zlistx_first (). First time, acts as zlistx_first().               
      #
      # @return [::FFI::Pointer]
      def next()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_next(self_p)
        result
      end

      # Return the previous item. At the start of the list (or in an empty list),
      # returns NULL. Use repeated zlistx_prev () calls to work through the list 
      # backwards from zlistx_last (). First time, acts as zlistx_last().        
      #
      # @return [::FFI::Pointer]
      def prev()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_prev(self_p)
        result
      end

      # Return the item at the tail of list. If the list is empty, returns NULL.
      # Leaves cursor pointing at the tail item, or NULL if the list is empty.  
      #
      # @return [::FFI::Pointer]
      def last()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_last(self_p)
        result
      end

      # Returns the value of the item at the cursor, or NULL if the cursor is
      # not pointing to an item.                                             
      #
      # @return [::FFI::Pointer]
      def item()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_item(self_p)
        result
      end

      # Returns the handle of the item at the cursor, or NULL if the cursor is
      # not pointing to an item.                                              
      #
      # @return [::FFI::Pointer]
      def cursor()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_cursor(self_p)
        result
      end

      # Returns the item associated with the given list handle, or NULL if passed     
      # in handle is NULL. Asserts that the passed in handle points to a list element.
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @return [::FFI::Pointer]
      def self.handle_item(handle)
        result = ::CZMQ::FFI.zlistx_handle_item(handle)
        result
      end

      # Find an item in the list, searching from the start. Uses the item     
      # comparator, if any, else compares item values directly. Returns the   
      # item handle found, or NULL. Sets the cursor to the found item, if any.
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @return [::FFI::Pointer]
      def find(item)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_find(self_p, item)
        result
      end

      # Detach an item from the list, using its handle. The item is not modified, 
      # and the caller is responsible for destroying it if necessary. If handle is
      # null, detaches the first item on the list. Returns item that was detached,
      # or null if none was. If cursor was at item, moves cursor to previous item,
      # so you can detach items while iterating forwards through a list.          
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @return [::FFI::Pointer]
      def detach(handle)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_detach(self_p, handle)
        result
      end

      # Detach item at the cursor, if any, from the list. The item is not modified,
      # and the caller is responsible for destroying it as necessary. Returns item 
      # that was detached, or null if none was. Moves cursor to previous item, so  
      # you can detach items while iterating forwards through a list.              
      #
      # @return [::FFI::Pointer]
      def detach_cur()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_detach_cur(self_p)
        result
      end

      # Delete an item, using its handle. Calls the item destructor is any is 
      # set. If handle is null, deletes the first item on the list. Returns 0 
      # if an item was deleted, -1 if not. If cursor was at item, moves cursor
      # to previous item, so you can delete items while iterating forwards    
      # through a list.                                                       
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @return [Integer]
      def delete(handle)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_delete(self_p, handle)
        result
      end

      # Move an item to the start of the list, via its handle.
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @return [void]
      def move_start(handle)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_move_start(self_p, handle)
        result
      end

      # Move an item to the end of the list, via its handle.
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @return [void]
      def move_end(handle)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_move_end(self_p, handle)
        result
      end

      # Remove all items from the list, and destroy them if the item destructor
      # is set.                                                                
      #
      # @return [void]
      def purge()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_purge(self_p)
        result
      end

      # Sort the list. If an item comparator was set, calls that to compare    
      # items, otherwise compares on item value. The sort is not stable, so may
      # reorder equal items.                                                   
      #
      # @return [void]
      def sort()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_sort(self_p)
        result
      end

      # Create a new node and insert it into a sorted list. Calls the item        
      # duplicator, if any, on the item. If low_value is true, starts searching   
      # from the start of the list, otherwise searches from the end. Use the item 
      # comparator, if any, to find where to place the new node. Returns a handle 
      # to the new node, or NULL if memory was exhausted. Resets the cursor to the
      # list head.                                                                
      #
      # @param item [::FFI::Pointer, #to_ptr]
      # @param low_value [Boolean]
      # @return [::FFI::Pointer]
      def insert(item, low_value)
        raise DestroyedError unless @ptr
        self_p = @ptr
        low_value = !(0==low_value||!low_value) # boolean
        result = ::CZMQ::FFI.zlistx_insert(self_p, item, low_value)
        result
      end

      # Move an item, specified by handle, into position in a sorted list. Uses 
      # the item comparator, if any, to determine the new location. If low_value
      # is true, starts searching from the start of the list, otherwise searches
      # from the end.                                                           
      #
      # @param handle [::FFI::Pointer, #to_ptr]
      # @param low_value [Boolean]
      # @return [void]
      def reorder(handle, low_value)
        raise DestroyedError unless @ptr
        self_p = @ptr
        low_value = !(0==low_value||!low_value) # boolean
        result = ::CZMQ::FFI.zlistx_reorder(self_p, handle, low_value)
        result
      end

      # Make a copy of the list; items are duplicated if you set a duplicator
      # for the list, otherwise not. Copying a null reference returns a null 
      # reference.                                                           
      #
      # @return [Zlistx]
      def dup()
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_dup(self_p)
        result = Zlistx.__new result, false
        result
      end

      # Set a user-defined deallocator for list items; by default items are not
      # freed when the list is destroyed.                                      
      #
      # @param destructor [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_destructor(destructor)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_set_destructor(self_p, destructor)
        result
      end

      # Set a user-defined duplicator for list items; by default items are not
      # copied when the list is duplicated.                                   
      #
      # @param duplicator [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_duplicator(duplicator)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_set_duplicator(self_p, duplicator)
        result
      end

      # Set a user-defined comparator for zlistx_find and zlistx_sort; the method 
      # must return -1, 0, or 1 depending on whether item1 is less than, equal to,
      # or greater than, item2.                                                   
      #
      # @param comparator [::FFI::Pointer, #to_ptr]
      # @return [void]
      def set_comparator(comparator)
        raise DestroyedError unless @ptr
        self_p = @ptr
        result = ::CZMQ::FFI.zlistx_set_comparator(self_p, comparator)
        result
      end

      # Self test of this class.
      #
      # @param verbose [Boolean]
      # @return [void]
      def self.test(verbose)
        verbose = !(0==verbose||!verbose) # boolean
        result = ::CZMQ::FFI.zlistx_test(verbose)
        result
      end
    end
  end
end

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Please refer to the README for information about making permanent changes.  #
################################################################################
